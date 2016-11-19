from flask import Flask
app = Flask(__name__)

say = "CC is awesome"
@app.route("/")
def hello():
    return "<h1>Hello World!</h1><h2>%s</h2>" % say

@app.route("/change/<word>")
def change(word):
    say = word
    return word

if __name__ == "__main__":
    app.run()
