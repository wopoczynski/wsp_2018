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
    #     todo validate object
    }
)

#MicroarrayData setter
setGeneric(name = "setMicroarrayData",
    def = function(theObject,data)
    {
        standardGeneric("setMicroarrayData")
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

#microarrayData getter
setGeneric(name = "getMicroarrayData",
           def = function(theObject)
           {
               standardGeneric("getMicroarrayData")
           }
)

setMethod(f="getMicroarrayData",
          signature = "ExpressionSet",
          definition = function(theObject)
          {
              return(theObject@microarrayData)
          })

#normalizationType setter
setGeneric(name = "setNormalizationType",
           def = function(theObject,normalizationType)
           {
               standardGeneric("setNormalizationType")
           }
)

setMethod(f="setNormalizationType",
          signature = "ExpressionSet",
          definition = function(theObject,normalizationType)
          {
              theObject@normalizationType <- normalizationType
              validObject(theObject)
              return(theObject)
          })

#normalizationType getter
setGeneric(name = "getNormalizationType",
           def = function(theObject)
           {
               standardGeneric("getNormalizationType")
           }
)

setMethod(f="getNormalizationType",
          signature = "ExpressionSet",
          definition = function(theObject)
          {
              return(theObject@normalizationType)
          })

#description setter
setGeneric(name = "setDescription",
           def = function(theObject,description)
           {
               standardGeneric("setDescription")
           }
)

setMethod(f="setDescription",
          signature = "ExpressionSet",
          definition = function(theObject,description)
          {
              theObject@description <- description
              validObject(theObject)
              return(theObject)
          })

#description getter
setGeneric(name = "getdescription",
           def = function(theObject)
           {
               standardGeneric("getdescription")
           }
)

setMethod(f="getdescription",
          signature = "ExpressionSet",
          definition = function(theObject)
          {
              return(theObject@description)
          })