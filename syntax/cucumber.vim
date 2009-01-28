" Vim syntax file
" Language:     Cucumber
" Maintainer:   Tim Pope <vimNOSPAM@tpope.info>
" Filenames:    *.feature

if exists("b:current_syntax")
    finish
endif

syn case match
syn sync minlines=20

let g:cucumber_languages = {
      \"en": {"and": "And", "background": "Background", "but": "But", "examples": "Examples|Scenarios", "feature": "Feature", "given": "Given", "scenario": "Scenario", "scenario_outline": "Scenario Outline", "then": "Then", "when": "When"},
      \"ar": {"and": "\u0648", "but": "\u0644\u0643\u0646", "feature": "\u062e\u0627\u0635\u064a\u0629", "given": "\u0628\u0641\u0631\u0636", "scenario": "\u0633\u064a\u0646\u0627\u0631\u064a\u0648", "then": "\u0627\u0630\u0627\u064b", "when": "\u0645\u062a\u0649"},
      \"cy": {"and": "A", "but": "Ond", "examples": "Enghreifftiau", "feature": "Arwedd", "given": "anrhegedig a", "scenario": "Scenario", "then": "Yna", "when": "Pryd"},
      \"cz": {"and": "A", "background": "Pozad\u00ed", "but": "Ale", "examples": "P\u0159\u00edklady", "feature": "Po\u017eadavek", "given": "Pokud", "scenario": "Sc\u00e9n\u00e1\u0159", "scenario_outline": "N\u00e1\u010drt Sc\u00e9n\u00e1\u0159e", "then": "Pak", "when": "Kdy\u017e"},
      \"da": {"and": "Og", "background": "Baggrund", "but": "Men", "examples": "Eksempler", "feature": "Egenskab", "given": "Givet", "scenario": "Scenarie", "scenario_outline": "Abstrakt Scenario", "then": "S\u00e5", "when": "N\u00e5r"},
      \"de": {"and": "Und", "background": "Grundlage", "but": "Aber", "examples": "Beispiele", "feature": "Funktionalit\u00e4t", "given": "Gegeben sei", "scenario": "Szenario", "scenario_outline": "Szenariogrundriss", "then": "Dann", "when": "Wenn"},
      \"en-lol": {"and": "AN", "background": "B4", "but": "BUT", "examples": "EXAMPLZ", "feature": "OH HAI", "given": "GIVN", "scenario": "MISHUN", "scenario_outline": "MISHUN SRSLY", "then": "DEN", "when": "WEN"},
      \"es": {"and": "Y", "background": "Antecedentes", "but": "Pero", "examples": "Ejemplos", "feature": "Caracter\u00edstica", "given": "Dado", "scenario": "Escenario", "scenario_outline": "Esquema del escenario", "then": "Entonces", "when": "Cuando"},
      \"et": {"and": "Ja", "but": "Kuid", "feature": "Omadus", "given": "Eeldades", "scenario": "Stsenaarium", "then": "Siis", "when": "Kui"},
      \"fi": {"and": "Ja", "but": "Mutta", "examples": "Tapaukset", "feature": "Ominaisuus", "given": "Oletetaan", "scenario": "Tapaus", "scenario_outline": "Tapausaihio", "then": "Niin", "when": "Kun"},
      \"fr": {"and": "Et", "but": "Mais", "examples": "Exemples", "feature": "Fonctionnalit\u00e9", "given": "Etant donn\u00e9", "scenario": "Sc\u00e9nario", "scenario_outline": "Sc\u00e9nario esquisse", "then": "Alors", "when": "Lorsque"},
      \"id": {"and": "Dan", "but": "Tapi", "examples": "Contoh", "feature": "Fitur", "given": "Dengan", "scenario": "Skenario", "scenario_outline": "Skenario konsep", "then": "Maka", "when": "Ketika"},
      \"it": {"and": "E", "but": "Ma", "feature": "Funzionalit\u00e0", "given": "Dato", "more_examples": "Pi\u00f9 esempi", "scenario": "Scenario", "then": "Allora", "when": "Quando"},
      \"ja": {"and": "\u304b\u3064", "but": "\u3057\u304b\u3057", "feature": "\u30d5\u30a3\u30fc\u30c1\u30e3", "given": "\u524d\u63d0", "more_examples": "\u4ed6\u306e\u30b5\u30f3\u30d7\u30eb", "scenario": "\u30b7\u30ca\u30ea\u30aa", "then": "\u306a\u3089\u3070", "when": "\u3082\u3057"},
      \"ko": {"and": "\uadf8\ub9ac\uace0", "but": "\ud558\uc9c0\ub9cc", "feature": "\uae30\ub2a5", "given": "\uc870\uac74", "scenario": "\uc608", "then": "\uadf8\ub7ec\uba74", "when": "\ub9cc\uc77c"},
      \"lt": {"and": "Ir", "but": "Bet", "examples": "Pavyzd\u017ei\u0173", "feature": "S\u0105vyb\u0117", "given": "Duota", "scenario": "Scenarijus", "then": "Tada", "when": "Kai"},
      \"nl": {"and": "En", "but": "Maar", "feature": "Functionaliteit", "given": "Gegeven", "scenario": "Scenario", "then": "Dan", "when": "Als"},
      \"no": {"and": "Og", "background": "Bakgrunn", "but": "Men", "examples": "Eksempler", "feature": "Egenskap", "given": "Gitt", "scenario": "Scenario", "scenario_outline": "Abstrakt Scenario", "then": "S\u00e5", "when": "N\u00e5r"},
      \"pl": {"and": "Oraz", "but": "Ale", "feature": "W\u0142a\u015bciwo\u015b\u0107", "given": "Dane", "scenario": "Scenariusz", "then": "Wtedy", "when": "Je\u017celi"},
      \"pt": {"and": "E", "but": "Mas", "feature": "Caracter\u00edstica", "given": "Dado", "scenario": "Cen\u00e1rio", "then": "Ent\u00e3o", "when": "Quando"},
      \"ro": {"and": "Si", "but": "Dar", "feature": "Functionalitate", "given": "Daca", "scenario": "Scenariu", "then": "Atunci", "when": "Cand"},
      \"ro2": {"and": "\u0218i", "but": "Dar", "feature": "Func\u021bionalitate", "given": "Dac\u0103", "scenario": "Scenariu", "then": "Atunci", "when": "C\u00e2nd"},
      \"ru": {"and": "\u0418", "but": "\u041d\u043e", "feature": "\u0424\u0443\u043d\u043a\u0446\u0438\u043e\u043d\u0430\u043b", "given": "\u0421\u043d\u0430\u0447\u0430\u043b\u0430", "scenario": "\u0421\u0446\u0435\u043d\u0430\u0440\u0438\u0439", "then": "\u0422\u043e", "when": "\u0415\u0441\u043b\u0438"},
      \"se": {"and": "Och", "background": "Bakgrund", "but": "Men", "examples": "Exempel", "feature": "Egenskap", "given": "Givet", "scenario": "Scenario", "scenario_outline": "Abstrakt Scenario", "then": "S\u00e5", "when": "N\u00e4r"},
      \"zh-CN": {"and": "\u800c\u4e14", "but": "\u4f46\u662f", "feature": "\u529f\u80fd", "given": "\u5047\u5982", "scenario": "\u573a\u666f", "then": "\u90a3\u4e48", "when": "\u5f53"}}

function! s:pattern(key)
  return '\<\%('.join(map(values(g:cucumber_languages),'substitute(get(v:val,a:key,"\\%(a\\&b\\)"),"|","\\\\|","g")'),'\|').'\)\%(\>\|[[:alnum:]]\@<!\)'
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
  exe 'syn cluster cucumberStepRegions add=cucumber'.a:name.'Region,cucumber'.a:name.'AndRegion,cucumber'.a:name.'ButRegion'
endfunction

syn match   cucumberComment  "\%(^\s*\)\@<=#.*"

exe 'syn match cucumberFeature "\%(^\s*\)\@<='.s:pattern('feature').':"'
exe 'syn match cucumberBackground "\%(^\s*\)\@<='.s:pattern('background').':"'
exe 'syn match cucumberScenario "\%(^\s*\)\@<='.s:pattern('scenario').':"'
exe 'syn match cucumberScenarioOutline "\%(^\s*\)\@<='.s:pattern('scenario_outline').':"'
exe 'syn match cucumberExamples "\%(^\s*\)\@<='.s:pattern('examples').':" nextgroup=cucumberExampleTable skipnl skipwhite'

syn match   cucumberPlaceholder   "<[^<>]*>" contained containedin=@cucumberStepRegions
syn match   cucumberExampleTable  "\%(^\s*\)\@<=|.*" contains=cucumberDelimiter
syn match   cucumberDelimiter     "|" contained
syn region  cucumberString   start=+\%(^\s*\)\@<="""+ end=+"""+

call s:Add('Then')
call s:Add('When')
call s:Add('Given')

hi def link cucumberComment           Comment
hi def link cucumberFeature           Macro
hi def link cucumberBackground        Define
hi def link cucumberScenario          Define
hi def link cucumberScenarioOutline   Define
hi def link cucumberExamples          Define
hi def link cucumberPlaceholder       Constant
hi def link cucumberDelimiter         Delimiter
hi def link cucumberString            String
hi def link cucumberGiven             Conditional
hi def link cucumberWhen              Function
hi def link cucumberThen              Type

let b:current_syntax = "cucumber"

" vim:set sts=2 sw=2:
