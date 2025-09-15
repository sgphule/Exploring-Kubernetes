from flask import Flask, render_template, request
from markupsafe import escape

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def home():
    message = ""
    if request.method == "POST":
        name = request.form.get("name")
        if name and name.strip():
            message = f"Hello {escape(name)}, Welcome to the Kubernetes application!!!"
        else:
            message = "Please enter a valid name."
    return render_template("index.html", message=message)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)