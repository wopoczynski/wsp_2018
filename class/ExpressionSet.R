# Title     : TODO
# Objective : TODO
# Created by: Wojtek
# Created on: 07.05.2018


library("biobase");



ExpressionSet <- setClass(
    "ExpressionSet",
    slots = c(
        microarrayData = "microarrayData",
        normalizationType = "RMA",
        description = "desc"
    ),

    prototype = list(
        microarrayData = c(0,0,0,0),
        normalizationType = "RMA",
        description = "Basic description of data"
    ),

    validity = function(object)
    {
    #     todo
    }
)

setGeneric(name = "setMicroarrayData",
    def = function(theObject,data)
    {
        standardGeneric("setLocation")
    }
)

setMethod(f="setMicroarrayData",
    signature = "ExpressionSet",
    definition = function(theObject,microarrayData)
        {
        theObject@microarrayData <- microarrayData
        validObject(theObject)
        return(theObject)
    })

