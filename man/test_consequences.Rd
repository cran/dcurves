% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test_consequences.R
\name{test_consequences}
\alias{test_consequences}
\title{Test Consequences}
\usage{
test_consequences(
  formula,
  data,
  statistics = c("pos_rate", "neg_rate", "test_pos_rate", "test_neg_rate", "tp_rate",
    "fp_rate", "fn_rate", "tn_rate", "ppv", "npv", "sens", "spec", "lr_pos", "lr_neg"),
  thresholds = seq(0, 1, by = 0.25),
  label = NULL,
  time = NULL,
  prevalence = NULL
)
}
\arguments{
\item{formula}{a formula with the outcome on the LHS and a sum of
markers/covariates to test on the RHS}

\item{data}{a data frame containing the variables in \verb{formula=}.}

\item{statistics}{Character vector with statistics to return. See below for details}

\item{thresholds}{vector of threshold probabilities between 0 and 1.
Default is \code{seq(0, 0.99, by = 0.01)}. Thresholds at zero are replaced
with 10e-10.}

\item{label}{named list of variable labels, e.g. \code{list(age = "Age, years")}}

\item{time}{if outcome is survival, \verb{time=} specifies the time the
assessment is made}

\item{prevalence}{When \code{NULL}, the prevalence is estimated from \verb{data=}.
If the data passed is a case-control set, the population prevalence
may be set with this argument.}
}
\value{
a tibble with test consequences
}
\description{
Test Consequences
}
\section{statistics}{


The following diagnostic statistics are available to return.

\if{html}{\figure{two-by-two-table.png}{options: width=35\%}}\tabular{lll}{
   \strong{Statistic} \tab \strong{Abbreviation} \tab \strong{Definition} \cr
   Outcome Positive Rate \tab \code{"pos_rate"} \tab \code{(a + c) / (a + b + c + d)} \cr
   Outcome Negative Rate \tab \code{"neg_rate"} \tab \code{(b + d) / (a + b + c + d)} \cr
   Test Positive Rate \tab \code{"test_pos_rate"} \tab \code{(a + b) / (a + b + c + d)} \cr
   Test Negative Rate \tab \code{"test_neg_rate"} \tab \code{(c + d) / (a + b + c + d)} \cr
   True Positive Rate \tab \code{"tp_rate"} \tab \code{a / (a + b + c + d)} \cr
   False Positive Rate \tab \code{"fp_rate"} \tab \code{b / (a + b + c + d)} \cr
   False Negative Rate \tab \code{"fn_rate"} \tab \code{c / (a + b + c + d)} \cr
   True Negative Rate \tab \code{"tn_rate"} \tab \code{d / (a + b + c + d)} \cr
   Positive Predictive Value \tab \code{"ppv"} \tab \code{a / (a + b)} \cr
   Negative Predictive Value \tab \code{"npv"} \tab \code{d / (c + d)} \cr
   Sensitivity \tab \code{"sens"} \tab \code{a / (a + c)} \cr
   Specificity \tab \code{"spec"} \tab \code{d / (b + d)} \cr
   Positive Likelihood Ratio \tab \code{"lr_pos"} \tab \code{sens / (1 - spec)} \cr
   Negative Likelihood Ratio \tab \code{"lr_neg"} \tab \code{(1 - sens) / spec} \cr
}
}

\examples{
test_consequences(cancer ~ cancerpredmarker, data = df_binary)
}
