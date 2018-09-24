" Vim syntax file
" Language: SPL
" Maintainer: Foster McLane
" Last Change: 2018-09-24

" guard for other syntaxes
if exists('b:current_syntax')
  finish
endif
let b:current_syntax='spl'

" comments
syn region splComment start='`comment("' end='")`'

" strings
syntax region splDoubleString start=/"/ skip=/\\"/ end=/"/
syntax region splSingleString start=/'/ skip=/\\'/ end=/'/

" numbers
syntax match splNumber '\v<\d+>'
syntax match splFloat '\v<\d+\.\d+>'

" separators
syntax keyword splSeparator
      \ =
      \ |

" specials
syntax keyword splSpecial
      \ *

" constants
syntax keyword splConstant
      \ false
      \ true

" operators
syntax keyword splOperator
      \ and
      \ AND
      \ not
      \ NOT
      \ or
      \ OR
      \ by
      \ BY
      \ as
      \ AS
      \ over
      \ size

" identifiers
syntax keyword splIdentifier
      \ time
      \ span
      \ earliest
      \ latest
      \ limit
      \ minspan
      \ start
      \ end

" search commands
syntax keyword splCommand
      \ abstract
      \ accum
      \ addcoltotals
      \ addinfo
      \ addtotals
      \ analyzefields
      \ anomalies
      \ anomalousvalue
      \ anomalydetection
      \ append
      \ appendcols
      \ appendpipe
      \ arules
      \ associate
      \ audit
      \ autoregress
      \ bin
      \ bucket
      \ bucketdir
      \ chart
      \ cluster
      \ cofilter
      \ collect
      \ concurrency
      \ contingency
      \ convert
      \ correlate
      \ ctable
      \ datamodel
      \ dbinspect
      \ dedup
      \ delete
      \ delta
      \ diff
      \ erex
      \ eval
      \ eventcount
      \ eventstats
      \ extract
      \ fieldformat
      \ fields
      \ fieldsummary
      \ filldown
      \ fillnull
      \ findtypes
      \ folderize
      \ foreach
      \ format
      \ from
      \ gauge
      \ gentimes
      \ geom
      \ geomfilter
      \ geostats
      \ head
      \ highlight
      \ history
      \ iconify
      \ input
      \ inputcsv
      \ inputlookup
      \ iplocation
      \ join
      \ kmeans
      \ kvform
      \ loadjob
      \ localize
      \ localop
      \ lookup
      \ makecontinuous
      \ makemv
      \ makeresults
      \ map
      \ mcollect
      \ metadata
      \ metasearch
      \ meventcollect
      \ mstats
      \ multikv
      \ multisearch
      \ mvcombine
      \ mvexpand
      \ nomv
      \ outlier
      \ outputcsv
      \ outputlookup
      \ outputtext
      \ overlap
      \ pivot
      \ predict
      \ rangemap
      \ rare
      \ redistribute
      \ regex
      \ relevancy
      \ reltime
      \ rename
      \ replace
      \ rest
      \ return
      \ reverse
      \ rex
      \ rtorder
      \ run
      \ savedsearch
      \ script
      \ scrub
      \ search
      \ searchtxn
      \ selfjoin
      \ sendemail
      \ set
      \ setfields
      \ sichart
      \ sirare
      \ sistats
      \ sitimechart
      \ sitop
      \ sort
      \ spath
      \ stats
      \ strcat
      \ streamstats
      \ table
      \ tags
      \ tail
      \ timechart
      \ timewrap
      \ top
      \ transaction
      \ transpose
      \ trendline
      \ tscollect
      \ tstats
      \ typeahead
      \ typelearner
      \ typer
      \ union
      \ uniq
      \ untable
      \ where
      \ x11
      \ xmlkv
      \ xmlunescape
      \ xpath
      \ xyseries

" internal commands
syntax keyword splInternal
      \ collapse
      \ dump
      \ findkeywords
      \ mcatalog
      \ noop
      \ runshellscript
      \ sendalert

" eval functions
syntax keyword splEvalFunction
      \ abs
      \ acos
      \ acosh
      \ asin
      \ asinh
      \ atan
      \ atan2
      \ atanh
      \ case
      \ cidrmatch
      \ ceiling
      \ coalesce
      \ commands
      \ cos
      \ cosh
      \ exact
      \ exp
      \ false
      \ floor
      \ hypot
      \ if
      \ in
      \ isbool
      \ isint
      \ isnotnull
      \ isnull
      \ isnum
      \ isstr
      \ len
      \ like
      \ ln
      \ log
      \ lower
      \ ltrim
      \ match
      \ max
      \ md5
      \ min
      \ mvappend
      \ mvcount
      \ mvdedup
      \ mvfilter
      \ mvfind
      \ mvindex
      \ mvjoin
      \ mvrange
      \ mvsort
      \ mvzip
      \ now
      \ null
      \ nullif
      \ pi
      \ pow
      \ printf
      \ random
      \ relative_time
      \ replace
      \ round
      \ rtrim
      \ searchmatch
      \ sha1
      \ sha256
      \ sha512
      \ sigfig
      \ sin
      \ sinh
      \ spath
      \ split
      \ sqrt
      \ strftime
      \ strptime
      \ substr
      \ tan
      \ tanh
      \ time
      \ tonumber
      \ tostring
      \ trim
      \ true
      \ typeof
      \ upper
      \ urldecode
      \ validate

" eval operators
syntax keyword splEvalOperator
      \ +
      \ -
      \ *
      \ /
      \ ==
      \ !=
      \ <
      \ <=
      \ >
      \ >=

" stat functions
syntax keyword splStatFunction
      \ avg
      \ count
      \ distinct_count
      \ estdc
      \ estdc_error
      \ max
      \ mean
      \ median
      \ min
      \ mode
      \ percentile
      \ range
      \ stdev
      \ stdevp
      \ sum
      \ sumsq
      \ var
      \ varp
      \ earliest
      \ first
      \ last
      \ latest
      \ list
      \ values
      \ per_day
      \ per_hour
      \ per_minute
      \ per_second

" set highlights
highlight default link splComment Comment

highlight default link splDoubleString String
highlight default link splSingleString String

highlight default link splNumber Number
highlight default link splFloat Float

highlight default link splSeparator Special
highlight default link splSpecial Special

highlight default link splConstant Constant

highlight default link splOperator Operator

highlight default link splIdentifier Identifier

highlight default link splCommand Keyword
highlight default link splInternal Keyword

highlight default link splEvalFunction Function
highlight default link splEvalOperator Operator

highlight default link splStatFunction Function
