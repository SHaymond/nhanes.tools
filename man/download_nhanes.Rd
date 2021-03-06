% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/download_files.R
\name{download_nhanes}
\alias{download_nhanes}
\title{Download NHANES files}
\usage{
download_nhanes(ftp_url, setup, ...)
}
\arguments{
\item{ftp_url}{A specific URL to be downloaded via FTP and converted to an R dataframe}

\item{setup}{The list object from running nhanes_setup with the details needed for naming and saving the files}

\item{...}{To pass options to the download function (which wraps download.file()).  Also can set console = FALSE to skip messages for download progress, which is useful when running parallel.  When FALSE, invisibly returns the status of the download, which is later reported by the foreach package after all downloads have completed.}
}
\description{
This function selects the proper download function to use for each type of file, data and mortality.
}
\examples{
\dontrun{
# Example of basic download using a loop across all of the ftp download URLs.
# In this example, n is the object created by the function setup_nhanes() and
# filenames is created from teh function get_nhanes_filenames()
    for(file in filenames){
        download_nhanes(file, n)
    }
# Example of parallel download process
# Not quite twice as fast (on my computer)
# Returns a list of completed files at the end.  Set console = FALSE in above functions.
# Need to use foreach syntax for nested loops to redo above in completely parallel fashion (not shown)
library(foreach)
library(doMC) # use library(doSNOW) on Windows
registerDoMC(cores = 4) # set number of cores for your computer
foreach(file = filenames, .packages = c("foreign", "downloader"), .combine = rbind) \%dopar\% {
    download_nhanes(file, n, console = FALSE)
}
}
}

