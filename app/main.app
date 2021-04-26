from fastapi import FastAPI
from starlette.middleware.httpsredirect import HTTPSRedirectMiddleware
from starlette.middleware.trustedhost import TrustedHostMiddleware
app = FastAPI()


# List of approved origins to perform CORS requests, necessary for development purposes using usual yarn React workflows
origins = [
    "http://localhost:80",
    "http://localhost:30008",
]

# Boiler code copied from the official FastAPI page about CORS
# https://fastapi.tiangolo.com/tutorial/cors/?h=cors
app.add_middleware(
    Middleware(TrustedHostMiddleware, allowed_hosts=['bielcrystal.com', '*.bielcrystal.com']),
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}
