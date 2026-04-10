from fastapi import FastAPI
from database.Database import engine
from models.base import Base
from routes import auth
from fastapi.middleware.cors import CORSMiddleware

Base.metadata.create_all(bind=engine)

app = FastAPI() 

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # allow all for development
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def Home():
    return {"message": "Welcome to the Snooker Manager Backend!"}   

app.include_router(auth.router, prefix='/auth',)
