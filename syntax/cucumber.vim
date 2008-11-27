" Vim syntax file
" Language:     Cucumber
" Maintainer:   Tim Pope <vimNOSPAM@tpope.info>
" Filenames:    *.feature

if exists("b:current_syntax")
    finish
endif

syn case match
syn sync minlines=20

let g:cucumber_langauges = {
      \"en": {"and": "And", "but": "But", "feature": "Feature", "given": "Given", "given_scenario": "GivenScenario", "more_examples": "More Examples", "scenario": "Scenario", "then": "Then", "when": "When"},
      \"ar": {"and": "\u0648", "but": "\u0644\u0643\u0646", "feature": "\u062e\u0627\u0635\u064a\u0629", "given": "\u0628\u0641\u0631\u0636", "given_scenario": "\u0628\u0641\u0631\u0636 \u0633\u064a\u0646\u0627\u0631\u064a\u0648 \u0645\u0639\u064a\u0646", "more_examples": "\u0627\u0645\u062b\u0644\u0629 \u0627\u0643\u062b\u0631", "scenario": "\u0633\u064a\u0646\u0627\u0631\u064a\u0648", "then": "\u0627\u0630\u0627\u064b", "when": "\u0645\u062a\u0649"},
      \"cy": {"and": "A", "but": "Ond", "feature": "Arwedd", "given": "anrhegedig a", "given_scenario": "Anrhegedig scenario", "more_examples": "Hychwaneg enghreifftiau", "scenario": "Scenario", "then": "Yna", "when": "Pryd"},
      \"da": {"and": "Og", "but": "Men", "feature": "Egenskab", "given": "Givet", "given_scenario": "GivetScenarie", "scenario": "Scenarie", "then": "S\u00e5", "when": "N\u00e5r"},
      \"de": {"and": "Und", "but": "Aber", "feature": "Funktionalit\u00e4t", "given": "Gegeben sei", "given_scenario": "Gegebenes Szenario", "more_examples": "Mehr Beispiele", "scenario": "Szenario", "then": "Dann", "when": "Wenn"},
      \"es": {"and": "Y", "but": "Pero", "feature": "Caracter\u00edstica", "given": "Dado", "given_scenario": "DadoElEscenario", "more_examples": "M\u00e1s ejemplos", "scenario": "Escenario", "then": "Entonces", "when": "Cuando"},
      \"et": {"and": "Ja", "but": "Kuid", "feature": "Omadus", "given": "Eeldades", "given_scenario": "EeldadesStsenaariumit", "scenario": "Stsenaarium", "then": "Siis", "when": "Kui"},
      \"fr": {"and": "Et", "but": "Mais", "feature": "Fonction", "given": "Soit", "given_scenario": "SoitScenario", "more_examples": "Plus d'exemples", "scenario": "Scenario", "then": "Alors", "when": "Lorsque"},
      \"id": {"and": "Dan", "but": "Tapi", "feature": "Fitur", "given": "Dengan", "given_scenario": "DenganSkenario", "more_examples": "Contoh Tambahan", "scenario": "Skenario", "then": "Maka", "when": "Ketika"},
      \"it": {"and": "E", "but": "Ma", "feature": "Funzionalit\u00e0", "given": "Dato", "given_scenario": "DatoLoScenario", "more_examples": "Pi\u00f9 esempi", "scenario": "Scenario", "then": "Allora", "when": "Quando"},
      \"ja": {"and": "\u304b\u3064", "but": "\u3057\u304b\u3057", "feature": "\u30d5\u30a3\u30fc\u30c1\u30e3", "given": "\u524d\u63d0", "given_scenario": "\u524d\u63d0\u30b7\u30ca\u30ea\u30aa", "more_examples": "\u4ed6\u306e\u30b5\u30f3\u30d7\u30eb", "scenario": "\u30b7\u30ca\u30ea\u30aa", "then": "\u306a\u3089\u3070", "when": "\u3082\u3057"},
      \"lt": {"and": "Ir", "but": "Bet", "feature": "S\u0105vyb\u0117", "given": "Duota", "given_scenario": "DuotasScenarijus", "more_examples": "Daugiau pavyzd\u017ei\u0173", "scenario": "Scenarijus", "then": "Tada", "when": "Kai"},
      \"nl": {"and": "En", "but": "Maar", "feature": "Functionaliteit", "given": "Gegeven", "given_scenario": "GegevenScenario", "more_examples": "Meer voorbeelden", "scenario": "Scenario", "then": "Dan", "when": "Als"},
      \"no": {"and": "Og", "but": "Men", "feature": "Egenskap", "given": "Gitt", "given_scenario": "GittScenario", "more_examples": "Flere eksempler", "scenario": "Scenario", "then": "S\u00e5", "when": "N\u00e5r"},
      \"pl": {"and": "Oraz", "but": "Ale", "feature": "W\u0142a\u015bciwo\u015b\u0107", "given": "Dane", "given_scenario": "DanyScenariusz", "more_examples": "Wi\u0119cejPrzyk\u0142ad\u00f3w", "scenario": "Scenariusz", "then": "Wtedy", "when": "Je\u017celi"},
      \"pt": {"and": "E", "but": "Mas", "feature": "Caracter\u00edstica", "given": "Dado", "given_scenario": "DadoOCen\u00e1rio", "scenario": "Cen\u00e1rio", "then": "Ent\u00e3o", "when": "Quando"},
      \"ro": {"and": "Si", "but": "Dar", "feature": "Functionalitate", "given": "Daca", "given_scenario": "ScenariuDat", "more_examples": "Mai multe exemple", "scenario": "Scenariu", "then": "Atunci", "when": "Cand"},
      \"ro2": {"and": "\u0218i", "but": "Dar", "feature": "Func\u021bionalitate", "given": "Dac\u0103", "given_scenario": "ScenariuDat", "more_examples": "Mai multe exemple", "scenario": "Scenariu", "then": "Atunci", "when": "C\u00e2nd"},
      \"ru": {"and": "\u0418", "but": "\u041d\u043e", "feature": "\u0424\u0443\u043d\u043a\u0446\u0438\u043e\u043d\u0430\u043b", "given": "\u0421\u043d\u0430\u0447\u0430\u043b\u0430", "given_scenario": "\u0414\u0430\u043d\u043d\u044b\u0439\u0421\u0446\u0435\u043d\u0430\u0440\u0438\u0439", "scenario": "\u0421\u0446\u0435\u043d\u0430\u0440\u0438\u0439", "then": "\u0422\u043e", "when": "\u0415\u0441\u043b\u0438"},
      \"se": {"and": "Och", "but": "Men", "feature": "Egenskap", "given": "Givet", "given_scenario": "GivetScenario", "scenario": "Scenario", "then": "S\u00e5", "when": "N\u00e4r"},
      \"zh-CN": {"and": "\u800c\u4e14", "but": "\u4f46\u662f", "feature": "\u529f\u80fd", "given": "\u5047\u5982", "given_scenario": "\u5f15\u7528\u573a\u666f", "scenario": "\u573a\u666f", "then": "\u90a3\u4e48", "when": "\u5f53"}}

function! s:pattern(key)
  return '\<\%('.join(map(values(g:cucumber_langauges),'get(v:val,a:key,"\\%(a\\&b\\)")'),'\|').'\)\%(\>\|[[:alnum:]]\@<!\)'
endfunction

function! s:Add(name)
  let next = " skipempty skipwhite nextgroup=".join(map(["Region","AndRegion","ButRegion","Comment","Table"],'"cucumber".a:name.v:val'),",")
  exe "syn region cucumber".a:name.'Region matchgroup=cucumber'.a:name.' start="\%(^\s*\)\@<=\%('.s:pattern(tolower(a:name)).'\)" end="$"'.next
  exe 'syn region cucumber'.a:name.'AndRegion matchgroup=cucumber'.a:name.'And start="\%(^\s*\)\@<='.s:pattern('and').'" end="$" contained'.next
  exe 'syn region cucumber'.a:name.'ButRegion matchgroup=cucumber'.a:name.'But start="\%(^\s*\)\@<='.s:pattern('but').'" end="$" contained'.next
  exe 'syn match cucumber'.a:name.'Comment "\%(^\s*\)\@<=#.*" contained'.next
  exe 'syn match cucumber'.a:name.'Table "\%(^\s*\)\@<=|.*" contained contains=cucumberDelimiter'.next
  exe 'hi def link cucumber'.a:name.'Comment cucumberComment'
  exe 'hi def link cucumber'.a:name.'But cucumber'.a:name.'And'
  exe 'hi def link cucumber'.a:name.'And cucumber'.a:name
endfunction

syn match   cucumberComment  "\%(^\s*\)\@<=#.*"

exe 'syn match cucumberFeature "\%(^\s*\)\@<='.s:pattern('feature').':"'
exe 'syn match cucumberScenario "\%(^\s*\)\@<='.s:pattern('scenario').':"'
exe 'syn match cucumberScenarioGiven "\%(^\s*\)\@<='.s:pattern('given_scenario').':"'
exe 'syn match cucumberMoreExamples "\%(^\s*\)\@<='.s:pattern('more_examples').':" nextgroup=cucumberExampleTable skipnl skipwhite'

syn match   cucumberExampleTable  "\%(^\s*\)\@<=|.*" contains=cucumberDelimiter
syn match   cucumberDelimiter     "|" contained
syn region  cucumberString   start=+\%(^\s*\)\@<="""+ end=+"""+

call s:Add('Then')
call s:Add('When')
call s:Add('Given')

hi def link cucumberComment           Comment
hi def link cucumberFeature           Macro
hi def link cucumberScenarioGiven     Include
hi def link cucumberScenario          Define
hi def link cucumberMoreExamples      Define
hi def link cucumberDelimiter         Delimiter
hi def link cucumberString            String
hi def link cucumberGiven             Conditional
hi def link cucumberWhen              Function
hi def link cucumberThen              Type

let b:current_syntax = "cucumber"

" vim:set sts=2 sw=2:
