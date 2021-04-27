FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8


RUN pip install fastapi uvicorn starlette


EXPOSE 9000

COPY ./app /app

#CMD exec unicorn main:app --host 0.0.0.0 --port 9000  --timeout-keep-alive 0

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000","--timeout-keep-alive", "0"]
