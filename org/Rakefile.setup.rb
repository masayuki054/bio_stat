EXCLUDES = [
  "Rakefile.org",
  "Makefile.org",
]

ORGS = [
  "bio.org",
 # "R-intro.org",
  "R-intro-1.org",
  "R-intro-2.org",
#  "R-intro-3.org",
#  "R-intro-4.org",
  "R-text.org"
]

  
SUBDIRS = [
]

HTMLS = ORGS.map do |f|
  File.basename(f,'.org')+".html"
end
