FROM ubuntu:24.04
RUN apt-get update && apt-get install --no-install-recommends -y pandoc python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --break-system-packages pdfminer.six

ENTRYPOINT ["/bin/sh", "-c", "pdf2txt.py -t html input.pdf | pandoc -f html -t asciidoc -o /output/output.adoc"]