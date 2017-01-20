friendship = require 'relativeLayout'

pager = new PageComponent
    width: Screen.width
    height: Screen.height
    scrollVertical: false

# Constants
hMargins = 50
bgColors = ['#fffa99','#baff99','#99dfff',
'#99b9ff','#b199ff','#ff99c9','#ff9447']
largeVMargin = 30
smallVMargin = 10

# 0. Find center
pgFindCenter = new Layer
	width: pager.width
	height: pager.height
	parent: pager

qPostalCode = new Layer
	html: 'What\'s your postal code?'
	width: 500
	height: 100
	parent: pgFindCenter
	backgroundColor: 'none'
	style: 
		textAlign: 'center'
		fontSize: '36px'
	color: '#000'
qPostalCode.centerX()

fPostalCode = new Layer
	width: 300
	height: 100
	html: 'eg: 10010'
friendship.below(fPostalCode, qPostalCode, smallVMargin)
fPostalCode.centerX()

fPostalCode.states.filled =
	html: ' 11223'

btnFindCenter = new Layer
	width: 300
	height: 100
	style:
		textAlign: 'center'
	backgroundColor: '#b5b5b5'
	color: '#333'
	html: 'Find clinic'
friendship.below(btnFindCenter, fPostalCode, smallVMargin)
btnFindCenter.centerX()

btnFindCenter.states.ready =
	backgroundColor: '#ef76df'




fPostalCode.on Events.Tap, (event) ->
	fPostalCode.stateSwitch('filled')
	btnFindCenter.animate('ready')

btnFindCenter.on Events.Tap, (event) ->
	print 'locating center'


pages = [pgFindCenter]
for i in [0..pages.length-1]
	pages[i].backgroundColor = bgColors[i]