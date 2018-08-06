" Vim syntax file
" Language: SPL
" Maintainer: Foster McLane
" Last Change: 2018-08-06

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
"
" contexts
syntax keyword splConstant
      \ false
      \ true

" separators
syntax keyword splSeparator
      \ =
      \ |

" eval commands
syntax keyword splEvalCommand
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

" eval context
syntax keyword splEvalOperator
      \ +
      \ -
      \ *
      \ /
      \ ==
      \ /=
      \ <
      \ <=
      \ >
      \ >=

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

" set highlights
highlight default link splComment Comment

highlight default link splDoubleString String
highlight default link splSingleString String

highlight default link splNumber Number
highlight default link splFloat Float

highlight default link splSeparator Special

highlight default link splConstant Constant

highlight default link splCommand Keyword

highlight default link splEvalCommand Keyword
highlight default link splEvalOperator Operator
