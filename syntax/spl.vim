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
syntax region splComment start='`comment("' end='")`'

" strings
syntax region splDoubleString start=/"/ skip=/\\"/ end=/"/
syntax region splSingleString start=/'/ skip=/\\'/ end=/'/

" numbers
syntax match splNumber '\v<\d+>'
syntax match splFloat '\v<\d+\.\d+>'

" separators
syntax keyword splSeparator contained
      \ =

" specials
syntax keyword splSpecial contained
      \ *

" operators
syntax keyword splOperator contained
      \ AND
      \ NOT
      \ OR
      \ by
      \ BY
      \ as
      \ AS
      \ over
      \ size

syntax keyword splBadOperator contained
      \ and
      \ or

" identifiers
syntax keyword splIdentifier contained
      \ time
      \ span
      \ earliest
      \ latest
      \ limit
      \ minspan
      \ start
      \ end

" eval constants
syntax keyword splEvalConstant contained
      \ false
      \ true

" eval functions
syntax keyword splEvalFunction contained
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
syntax keyword splEvalOperator contained
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
      \ and
      \ not
      \ or

" eval command
syntax match splEvalCommand contained
      \ /\%(^\s*\||\s*\)\@<=\%(eval\|where\)/

" eval region
syntax region splEval start=/\%(eval\|where\)\s\+/ end=/|\@=\|$/ contains=splEvalCommand,splEvalFunction,splEvalOperator

" stat functions
syntax keyword splStatFunction contained
      \ avg
      \ count
      \ distinct_count
      \ estdc
      \ estdc_error
      \ max
      \ mean
      \ medianexclusive
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

" stat command
syntax match splStatCommand contained
      \ /\%(^\s*\||\s*\)\@<=\%(stats\|eventstats\|geostats\|mstats\|sistats\|streamstats\|tstats\)/

" stat region
syntax region splStat start=/\%(stats\|eventstats\|geostats\|mstats\|sistats\|streamstats\|tstats\)\s\+/ end=/|\@=\|$/ contains=splStatCommand,splStatFunction

" search commands
syntax keyword splCommand contained
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
      \ eventcount
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
      \ searchtxn
      \ selfjoin
      \ sendemail
      \ set
      \ setfields
      \ sichart
      \ sirare
      \ sitimechart
      \ sitop
      \ sort
      \ spath
      \ strcat
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
      \ typeahead
      \ typelearner
      \ typer
      \ union
      \ uniq
      \ untable
      \ x11
      \ xmlkv
      \ xmlunescape
      \ xpath
      \ xyseries

" internal commands
syntax keyword splInternal contained
      \ collapse
      \ dump
      \ findkeywords
      \ mcatalog
      \ noop
      \ runshellscript
      \ sendalert

" search command
syntax match splSearchCommand contained
      \ /\%(^\s*\||\s*\)\@<=\%(search\)/

" search
syntax region splSearch start=/\%(search\)\s\+/ end=/|\@=\|$/ contains=splSearchCommand,splSeparator,splSpecial,splOperator,splBadOperator,splIdentifier

" implicit search
syntax region splImplicit start=/\|search\s\+/ end=/|\@=\|$/ contains=splSearchCommand,splSeparator,splSpecial,splOperator,splBadOperator,splIdentifier

" pipe
syntax match splPipe nextgroup=splEval,splStat,splSearch,splCommand,splInternal skipwhite skipnl skipempty
      \ /|/

" start of line
syntax match splStart nextgroup=splImplicit,splPipe skipwhite
      \ /^/

" set highlights
highlight default link splComment Comment

highlight default link splDoubleString String
highlight default link splSingleString String

highlight default link splNumber Number
highlight default link splFloat Float

highlight default link splSeparator Special
highlight default link splSpecial Special

highlight default link splOperator Operator
highlight default link splBadOperator Error

highlight default link splIdentifier Identifier

highlight default link splEvalConstant Constant
highlight default link splEvalFunction Function
highlight default link splEvalOperator Operator
highlight default link splEvalCommand Keyword

highlight default link splStatFunction Function
highlight default link splStatCommand Keyword

highlight default link splCommand Keyword
highlight default link splInternal Keyword

highlight default link splSearchCommand Keyword

highlight default link splPipe Special
