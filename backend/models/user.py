from models.base import Base
from sqlalchemy import Column, LargeBinary, String
import uuid

class UserTable(Base):
    __tablename__ = "users"
    id = Column(String, primary_key=True, default=lambda: str(uuid.uuid4()))  
    name = Column(String, index=True)
    email = Column(String, unique=True, index=True)
    password = Column(LargeBinary)
