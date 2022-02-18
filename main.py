import logging

from fastapi import FastAPI, Request

logging.basicConfig(
    format='[%(asctime)s][%(levelname)-5.5s][%(name)s:%(lineno)d]-> %(message)s',
    level=logging.INFO
)

logger = logging.getLogger(__name__)

app = FastAPI()


# https://github.com/tiangolo/fastapi/issues/819#issuecomment-569222914
@app.api_route("/{full_path:path}", methods=["GET", "POST", "DELETE"])
async def accept_all(r: Request):
    logger.info("request.url: %s" % r.url)
    logger.info("request.path parameters: %s" % r.path_params)
    logger.info("request.method: %s" % r.method)
    logger.info("request.query: %s" % r.query_params)
    logger.info("request.header: %s" % r.headers)
    body = await r.body()
    logger.info("request.body: %s" % body)
    return {"message": "got it"}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8080)
