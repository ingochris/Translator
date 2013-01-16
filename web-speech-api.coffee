if window.webkitSpeechRecognition
	recognition = new webkitSpeechRecognition()
	recognition.continuous = true # if false, speech recognition will end when the user stops talking, otherwise it keeps on recording until it is stopped manually
	recognition.interimResults = false # if false, the only results returned by the recognizer are final and will not change

	finalTranscript = null

	recognition.onresult = (event) ->
		transcript = ''
		for i in [event.resultIndex..event.results.length - 1] by 1
			if event.results[i].isFinal
				transcript += event.results[i][0].transcript
		$('#transcript').text $('#transcript').text() + transcript

	$('#startStopButton').on 'click', ->
		if this.innerText == 'Start'
			this.innerText = 'Stop'
			recognition.lang = 'en-AU'
			recognition.start()
		else
			this.innerText = 'Start'
			recognition.stop()
else
	alert 'Cannot access the speech recognition API.  Are you using Chrome 25+ ?'

# Sources
# -------
# http://updates.html5rocks.com/2013/01/Voice-Driven-Web-Apps-Introduction-to-the-Web-Speech-API
# https://github.com/GoogleChrome/webplatform-samples/tree/master/webspeechdemo