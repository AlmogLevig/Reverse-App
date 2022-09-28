from flask import Flask, request
from utils import query2Json


app = Flask(__name__)

@app.route('/reverse', methods=["GET", "POST"])
def home():
    if request.method == "POST":
        return "Oops something Error"
    else:
        return query2Json(request.url)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port="5000")


