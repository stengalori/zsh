# PROMPT
precmd_functions=(render_prompt)

function render_prompt {
  PROMPT=""
  PROMPT+="%(1j.%B%%%b .)"
  PROMPT+="%~ "
  PROMPT+="%(?.%F{141}.%F{203})%B$%b%f "
  RPROMPT="%(?..%F{203}[%?]%f)"
}

