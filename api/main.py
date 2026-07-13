from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List, Dict, Any
import os
from .core_pipeline import process_optimization_request

app = FastAPI(title="Rehab Neuro-Symbolic API")

class ScheduleRequest(BaseModel):
    target_date: str
    use_ml: bool = True
    payload: List[Dict[str, Any]]

class ScheduleResponse(BaseModel):
    status: str
    cost: list[int]
    unassigned_patients: int
    total_assignments: int
    raw_assignments: list[str]

@app.post("/optimize", response_model=ScheduleResponse)
async def optimize_schedule(req: ScheduleRequest):
    try:
        results = process_optimization_request(
            raw_docs=req.payload, 
            target_date=req.target_date,
            use_ml=req.use_ml
        )
        return results
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/")
def health_check():
    return {"status": "ok", "message": "Neuro-Symbolic Scheduler Engine is running!"}