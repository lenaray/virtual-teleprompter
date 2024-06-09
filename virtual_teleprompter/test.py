from flask import Flask, request, render_template, jsonify, redirect, url_for
import logging

app = Flask(__name__)

ai_response = None

@app.route('/')
def home():
    return redirect(url_for('teleprompter'))

@app.route('/api/response', methods=['POST'])
def receive_response():
    global ai_response
    data = request.get_json()
    ai_response = data.get('response')
    print(f'Received AI response: {ai_response}')
    # Process the response as needed

    # Redirect to the teleprompter route after receiving the response
    return redirect(url_for('teleprompter')), 302

@app.route('/api/latest_response', methods=['GET'])
def latest_response():
    global ai_response
    return jsonify({'response': ai_response})

@app.route('/teleprompter', methods=['GET'])
def teleprompter():
    global ai_response
    print(ai_response)
    # Retrieve the received AI response from the URL parameters
    response = ai_response if ai_response else 'Example AI response'
    print(response)
    return render_template('teleprompter.html', response=response)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5050, debug=True)