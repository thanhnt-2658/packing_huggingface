from transformers import pipeline
from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from pydantic import BaseModel

generator = pipeline('text-generation', model='gpt2')

app = FastAPI()

class Body(BaseModel):
    text: str
    
@app.get('/')
def root():
    return HTMLResponse('<h1>This is API to interact with GPT2 moddel</h1>')

@app.post('/generate')
def predict(body: Body):
    results = generator(body.text, max_length=35, num_return_sequences=1)
    return results[0]
