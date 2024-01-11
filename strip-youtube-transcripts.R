transcript <-
  readLines("statquest-transcripts/one-hot-statquest.txt") # read in the file

transcript <- transcript[nchar(transcript) > 5] # remove time stamps

# collapse into one string
transcript <- paste(
  transcript,
  collapse = " "
)

# Write the collapsed transcript to a new file
writeLines(
  transcript,
  "statquest-transcripts/one-hot-statquest-collapsed.txt"
)


### Function to process a single transcript file
# Function to process a single transcript file
process_transcript <- function(file_name) {
  transcript <- readLines(file_name)
  transcript <- transcript[nchar(transcript) > 5]
  transcript <- paste(transcript, collapse = " ")
  writeLines(transcript, paste0(file_name, "-collapsed.txt"))
}

# List of transcript files (replace with your actual file names)
file_list <- list.files(
  here::here(
    "statquest-transcripts"),
  full.names = TRUE
)

# Apply the function to all files in the list
lapply(file_list, process_transcript)
