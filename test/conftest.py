from pydantic_settings import BaseSettings
from pydantic import Field

class CommonSettings(BaseSettings):
    db_host: str = Field(env="DB_HOST", nullable=False)
    db_port: int = Field(env="DB_PORT", nullable=False)
    database: str = Field(env="DATABASE", nullable=False)
    db_user: str = Field(env="DB_USER", nullable=False)
    db_password: str = Field(env="DB_PASSWORD", nullable=False)


settings = CommonSettings()
