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
      \"ar": {"and": "\\%u0648", "background": "\\%u0627\\%u0644\\%u062e\\%u0644\\%u0641\\%u064a\\%u0629", "but": "\\%u0644\\%u0643\\%u0646", "examples": "\\%u0627\\%u0645\\%u062b\\%u0644\\%u0629", "feature": "\\%u062e\\%u0627\\%u0635\\%u064a\\%u0629", "given": "\\%u0628\\%u0641\\%u0631\\%u0636", "scenario": "\\%u0633\\%u064a\\%u0646\\%u0627\\%u0631\\%u064a\\%u0648", "scenario_outline": "\\%u0633\\%u064a\\%u0646\\%u0627\\%u0631\\%u064a\\%u0648 \\%u0645\\%u062e\\%u0637\\%u0637", "then": "\\%u0627\\%u0630\\%u0627\\%u064b|\\%u062b\\%u0645", "when": "\\%u0645\\%u062a\\%u0649|\\%u0639\\%u0646\\%u062f\\%u0645\\%u0627"},
      \"cy": {"and": "A", "but": "Ond", "examples": "Enghreifftiau", "feature": "Arwedd", "given": "anrhegedig a", "scenario": "Scenario", "then": "Yna", "when": "Pryd"},
      \"cz": {"and": "A", "background": "Pozad\\%u00ed", "but": "Ale", "examples": "P\\%u0159\\%u00edklady", "feature": "Po\\%u017eadavek", "given": "Pokud", "scenario": "Sc\\%u00e9n\\%u00e1\\%u0159", "scenario_outline": "N\\%u00e1\\%u010drt Sc\\%u00e9n\\%u00e1\\%u0159e", "then": "Pak", "when": "Kdy\\%u017e"},
      \"da": {"and": "Og", "background": "Baggrund", "but": "Men", "examples": "Eksempler", "feature": "Egenskab", "given": "Givet", "scenario": "Scenarie", "scenario_outline": "Abstrakt Scenario", "then": "S\\%u00e5", "when": "N\\%u00e5r"},
      \"de": {"and": "Und", "background": "Grundlage", "but": "Aber", "examples": "Beispiele", "feature": "Funktionalit\\%u00e4t", "given": "Gegeben sei", "scenario": "Szenario", "scenario_outline": "Szenariogrundriss", "then": "Dann", "when": "Wenn"},
      \"en-au": {"and": "N", "background": "Background", "but": "Cept", "examples": "Cobber", "feature": "Crikey", "given": "Ya know how", "scenario": "Mate", "scenario_outline": "Blokes", "then": "Ya gotta", "when": "When"},
      \"en-lol": {"and": "AN", "background": "B4", "but": "BUT", "examples": "EXAMPLZ", "feature": "OH HAI", "given": "I CAN HAZ", "scenario": "MISHUN", "scenario_outline": "MISHUN SRSLY", "then": "DEN", "when": "WEN"},
      \"es": {"and": "Y", "background": "Antecedentes", "but": "Pero", "examples": "Ejemplos", "feature": "Caracter\\%u00edstica", "given": "Dado", "scenario": "Escenario", "scenario_outline": "Esquema del escenario", "then": "Entonces", "when": "Cuando"},
      \"et": {"and": "Ja", "background": "Taust", "but": "Kuid", "examples": "Juhtumid", "feature": "Omadus", "given": "Eeldades", "scenario": "Stsenaarium", "scenario_outline": "Raamstsenaarium", "then": "Siis", "when": "Kui"},
      \"fi": {"and": "Ja", "background": "Tausta", "but": "Mutta", "examples": "Tapaukset", "feature": "Ominaisuus", "given": "Oletetaan", "scenario": "Tapaus", "scenario_outline": "Tapausaihio", "then": "Niin", "when": "Kun"},
      \"fr": {"and": "Et", "background": "Contexte", "but": "Mais", "examples": "Exemples", "feature": "Fonctionnalit\\%u00e9", "given": "Soit", "scenario": "Sc\\%u00e9nario", "scenario_outline": "Plan du Sc\\%u00e9nario", "then": "Alors", "when": "Lorsque"},
      \"id": {"and": "Dan", "background": "Dasar", "but": "Tapi", "examples": "Contoh", "feature": "Fitur", "given": "Dengan", "scenario": "Skenario", "scenario_outline": "Skenario konsep", "then": "Maka", "when": "Ketika"},
      \"it": {"and": "E", "background": "Contesto", "but": "Ma", "examples": "Esempi", "feature": "Funzionalit\\%u00e0", "given": "Dato", "scenario": "Scenario", "scenario_outline": "Schema dello scenario", "then": "Allora", "when": "Quando"},
      \"ja": {"and": "\\%u304b\\%u3064", "background": "\\%u80cc\\%u666f", "but": "\\%u3057\\%u304b\\%u3057", "examples": "\\%u4f8b|\\%u30b5\\%u30f3\\%u30d7\\%u30eb", "feature": "\\%u30d5\\%u30a3\\%u30fc\\%u30c1\\%u30e3", "given": "\\%u524d\\%u63d0", "scenario": "\\%u30b7\\%u30ca\\%u30ea\\%u30aa", "scenario_outline": "\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\%u30a2\\%u30a6\\%u30c8\\%u30e9\\%u30a4\\%u30f3|\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\%u30c6\\%u30f3\\%u30d7\\%u30ec\\%u30fc\\%u30c8|\\%u30c6\\%u30f3\\%u30d7\\%u30ec|\\%u30b7\\%u30ca\\%u30ea\\%u30aa\\%u30c6\\%u30f3\\%u30d7\\%u30ec", "then": "\\%u306a\\%u3089\\%u3070", "when": "\\%u3082\\%u3057"},
      \"ko": {"and": "\\%uadf8\\%ub9ac\\%uace0", "background": "\\%ubc30\\%uacbd", "but": "\\%ud558\\%uc9c0\\%ub9cc", "examples": "\\%uc608", "feature": "\\%uae30\\%ub2a5", "given": "\\%uc870\\%uac74", "scenario": "\\%uc2dc\\%ub098\\%ub9ac\\%uc624", "scenario_outline": "\\%uc2dc\\%ub098\\%ub9ac\\%uc624 \\%uac1c\\%uc694", "then": "\\%uadf8\\%ub7ec\\%uba74", "when": "\\%ub9cc\\%uc77c"},
      \"lt": {"and": "Ir", "but": "Bet", "examples": "Pavyzd\\%u017ei\\%u0173", "feature": "S\\%u0105vyb\\%u0117", "given": "Duota", "scenario": "Scenarijus", "then": "Tada", "when": "Kai"},
      \"nl": {"and": "En", "background": "Achtergrond", "but": "Maar", "examples": "Voorbeelden", "feature": "Functionaliteit", "given": "Gegeven", "scenario": "Scenario", "scenario_outline": "Abstract Scenario", "then": "Dan", "when": "Als"},
      \"no": {"and": "Og", "background": "Bakgrunn", "but": "Men", "examples": "Eksempler", "feature": "Egenskap", "given": "Gitt", "scenario": "Scenario", "scenario_outline": "Abstrakt Scenario", "then": "S\\%u00e5", "when": "N\\%u00e5r"},
      \"pl": {"and": "Oraz", "but": "Ale", "feature": "W\\%u0142a\\%u015bciwo\\%u015b\\%u0107", "given": "Dane", "scenario": "Scenariusz", "then": "Wtedy", "when": "Je\\%u017celi"},
      \"pt": {"and": "E", "background": "Contexto", "but": "Mas", "examples": "Exemplos", "feature": "Caracter\\%u00edstica", "given": "Dado", "scenario": "Cen\\%u00e1rio", "scenario_outline": "Esquema do Cen\\%u00e1rio", "then": "Ent\\%u00e3o", "when": "Quando"},
      \"ro": {"and": "Si", "but": "Dar", "feature": "Functionalitate", "given": "Daca", "scenario": "Scenariu", "then": "Atunci", "when": "Cand"},
      \"ro2": {"and": "\\%u0218i", "but": "Dar", "feature": "Func\\%u021bionalitate", "given": "Dac\\%u0103", "scenario": "Scenariu", "then": "Atunci", "when": "C\\%u00e2nd"},
      \"ru": {"and": "\\%u0418|\\%u041a \\%u0442\\%u043e\\%u043c\\%u0443 \\%u0436\\%u0435", "background": "\\%u041f\\%u0440\\%u0435\\%u0434\\%u044b\\%u0441\\%u0442\\%u043e\\%u0440\\%u0438\\%u044f", "but": "\\%u041d\\%u043e|\\%u0410", "examples": "\\%u0417\\%u043d\\%u0430\\%u0447\\%u0435\\%u043d\\%u0438\\%u044f", "feature": "\\%u0424\\%u0443\\%u043d\\%u043a\\%u0446\\%u0438\\%u043e\\%u043d\\%u0430\\%u043b", "given": "\\%u0414\\%u043e\\%u043f\\%u0443\\%u0441\\%u0442\\%u0438\\%u043c", "scenario": "\\%u0421\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u0439", "scenario_outline": "\\%u0421\\%u0442\\%u0440\\%u0443\\%u043a\\%u0442\\%u0443\\%u0440\\%u0430 \\%u0441\\%u0446\\%u0435\\%u043d\\%u0430\\%u0440\\%u0438\\%u044f", "then": "\\%u0422\\%u043e", "when": "\\%u0415\\%u0441\\%u043b\\%u0438"},
      \"se": {"and": "Och", "background": "Bakgrund", "but": "Men", "examples": "Exempel", "feature": "Egenskap", "given": "Givet", "scenario": "Scenario", "scenario_outline": "Abstrakt Scenario", "then": "S\\%u00e5", "when": "N\\%u00e4r"},
      \"sk": {"and": "A", "background": "Pozadie", "but": "Ale", "examples": "Pr\\%u00edklady", "feature": "Po\\%u017eiadavka", "given": "Pokia\\%u013e", "scenario": "Scen\\%u00e1r", "scenario_outline": "N\\%u00e1\\%u010drt Scen\\%u00e1ru", "then": "Tak", "when": "Ke\\%u010f"},
      \"zh-CN": {"and": "\\%u800c\\%u4e14", "background": "\\%u80cc\\%u666f", "but": "\\%u4f46\\%u662f", "examples": "\\%u4f8b\\%u5b50", "feature": "\\%u529f\\%u80fd", "given": "\\%u5047\\%u5982", "scenario": "\\%u573a\\%u666f", "scenario_outline": "\\%u573a\\%u666f\\%u5927\\%u7eb2", "then": "\\%u90a3\\%u4e48", "when": "\\%u5f53"},
      \"zh-TW": {"and": "\\%u800c\\%u4e14|\\%u4e26\\%u4e14", "background": "\\%u80cc\\%u666f", "but": "\\%u4f46\\%u662f", "examples": "\\%u4f8b\\%u5b50", "feature": "\\%u529f\\%u80fd", "given": "\\%u5047\\%u8a2d", "scenario": "\\%u5834\\%u666f|\\%u5287\\%u672c", "scenario_outline": "\\%u5834\\%u666f\\%u5927\\%u7db1|\\%u5287\\%u672c\\%u5927\\%u7db1", "then": "\\%u90a3\\%u9ebc", "when": "\\%u7576"}}

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
syn match   cucumberTags          "\%(^\s*\)\@<=\%(@[^@[:space:]]\+\s\+\)*@[^@[:space:]]\+\s*$"
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
hi def link cucumberTags              Tag
hi def link cucumberString            String
hi def link cucumberGiven             Conditional
hi def link cucumberWhen              Function
hi def link cucumberThen              Type

let b:current_syntax = "cucumber"

" vim:set sts=2 sw=2:
