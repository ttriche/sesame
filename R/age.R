Hv.age2response <- function(x, adult.age=20) {
    ## trafo
    x=(x+1)/(adult.age+1)
    ifelse(x<=1,log(x),x-1)
}

Hv.response2age <- function(x, adult.age=20) {
    ## anti.trafo
    ifelse(
        x<0,
        (1+adult.age)*exp(x)-1,
        (1+adult.age)*x+adult.age)
}

#' Horvath 353 age predictor
#'
#' The function takes a named numeric vector of beta values. The name attribute
#' contains the probe ID (cg, ch or rs IDs). The function looks for overlapping
#' probes and estimate age using Horvath aging model (Horvath 2013
#' Genome Biology). The function outputs a single numeric of age in years.
#'
#' @param betas a probeID-named vector of beta values
#' @return age in years
#' @export
#' @examples
#' betas <- sesameDataGet('HM450.1.TCGA.PAAD')$betas
#' predictAgeHorvath353(betas)
predictAgeHorvath353 <- function(betas) {

    Hv <- sesameDataGet('age.inference')$Horvath353
    probes <- intersect(names(na.omit(betas)), Hv$CpGmarker[-1])

    if (length(probes) < 10) {
        stop('Fewer than 10 matching probes left. Age prediction abort.')
    }

    drop(Hv.response2age(
        Hv$CoefficientTraining[1] + 
            Hv$CoefficientTraining[match(probes, Hv$CpG)] %*% betas[probes]))
}
