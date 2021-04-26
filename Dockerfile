FROM tiangolo/uvicorn-gunicorn-fastapi:python3.8


RUN pip install fastapi uvicorn starlette


EXPOSE 9000

COPY ./app /app

CMD exec gunicorn main:app -b 0.0.0.0:9000  -k uvicorn.workers.UvicornH11Worker

# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "9000"]
