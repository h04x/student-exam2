FROM python:3

COPY js_example /js_exampple
COPY setup.cfg /
COPY setup.py /

RUN python3 -m venv venv
RUN . venv/bin/activate
RUN pip install -e .

EXPOSE 5000

ENV FLASK_APP=js_example
CMD ["flask", "run", "--host", "0.0.0.0"]
