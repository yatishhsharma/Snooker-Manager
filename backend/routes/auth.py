
from database.Database import get_db
from fastapi import HTTPException, APIRouter, Depends
from schemas.create_user import  CreateUser
from models.user import UserTable
from schemas.user_login import user_login
from schemas.user import UserResponse
from sqlalchemy.orm import Session
import bcrypt



router = APIRouter()

@router.post("/Signup")
async def signup(user: CreateUser, db: Session=Depends(get_db)):
    
    user_db = db.query(UserTable).filter(UserTable.email == user.email).first()

    if user_db:
        raise HTTPException(400, "The User Already Exists!, Try Login"   )
    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    user_db = UserTable( name = user.name, email = user.email, password = hashed_pw)
    db.add(user_db)
    db.commit()
    
    db.refresh(user_db)
    return user_db


@router.post("/Signin")
async def signin(user: user_login, db: Session=Depends(get_db)):

    user_db = db.query(UserTable).filter(UserTable.email == user.email).first()
    
    if not user_db:
        raise HTTPException(400, f"The User with Email : {user.email} is not exists!")
    hashed_pw = user.password.encode()
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)
    if not is_match:
        raise HTTPException(400, "Incorrect Password!, Try again...")
    return user_db
    
