exports.below = (thisLayer, referenceLayer, space=0) ->
	thisLayer.y = referenceLayer.y + referenceLayer.height + space