## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
* We've addressed the original CRAN feedback in this release:

> Please always explain all acronyms in the description text. -> UCI ML

In the DESCRIPTION, we fully spell out the acronym: 

University of California Irvine Machine Learning (UCI ML) Repository

> Please provide a link to the used webservices to the description field
of your DESCRIPTION file in the form
http:... or https:...
with angle brackets for auto-linking and no space after 'http:' and
'https:'.

In the DESCRIPTINO, we provide the link to the UCI ML Repository in both the
URL field and at the end of the DESCRIPTION paragraph: 

https://archive.ics.uci.edu/

> The Description field is intended to be a (one paragraph) description of
what the package does and why it may be useful. Please add more details
about the package functionality and implemented methods in your
Description text.

In the DESCRIPTION, we provide a more detailed description of the package:

Find and import datasets from the
University of California Irvine Machine Learning (UCI ML) Repository into R.
Supports working with data from UCI ML repository inside of R scripts, notebooks, 
and 'Quarto'/'RMarkdown' documents. Access the UCI ML repository directly at
<https://archive.ics.uci.edu/>.

> You write information messages to the console that cannot be easily
suppressed.
It is more R like to generate objects that can be used to extract the
information a user is interested in, and then print() that object.
Instead of cat() rather use message()/warning() or if(verbose)cat(..)
(or maybe stop()) if you really have to write text to the console.
(except for print, summary, interactive functions) ->
R/list-available-datasets.R

We've changed how `list_available_datasets()` works so that it now has its
own `print()` method to display the datasets in a more R-like manner while
retaining the original print formatting of the Python package.

* Spell check detects the UCI acronym as a misspelled word. However, 
  that is not misspelled. 
  Possibly misspelled words in DESCRIPTION:
  UCI (2:16, 13:55, 14:37, 15:52)
