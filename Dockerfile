FROM elasticsearch:5.5.2

RUN apt-get update && apt-get install -y build-essential \
	python-setuptools python-dev \
	python-numpy python-scipy python-pip

COPY requirements.txt /tmp
RUN pip install --no-cache-dir -r /tmp/requirements.txt

RUN wget https://s3.amazonaws.com/ahalterman-geo/geonames_index.tar.gz --output-file=wget_log.txt
RUN tar -xzf geonames_index.tar.gz

EXPOSE 9200

CMD ["sh", "start.sh"]
