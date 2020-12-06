FROM pataquets/ubuntu:bionic
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install \
      default-jre-headless zip \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
ADD . /
RUN unzip /stanford-corenlp-4.1.0.zip && rm /stanford-corenlp-4.1.0.zip

WORKDIR /stanford-corenlp-4.1.0
RUN java -version

EXPOSE 9000
# TODO(Zahin): Pass in corenlp config via env variables
# CMD java -Xmx${MEMORY} -cp '${CORENLP_HOME}/*'  edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port ${PORT} -timeout ${TIMEOUT} -threads ${DEFAULT_THREADS} -maxCharLength ${MAX_CHAR_LENGTH} -quiet ${BE_QUIET}
CMD java -Xmx5g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port 9000 -timeout 15000
