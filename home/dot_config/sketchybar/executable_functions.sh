
# Pulls a value from the YAML config file, based on a given key name.
yaml() {
  yq "$1 | explode(.)" < $HOME/.config/sketchybar/config.yaml
}


# Internal method for building a profiles list.
_get_profiles_list() {
  if [[ "$(hostname | cut -d'.' -f1)" != "mac-studio" ]]; then
    profile_list="laptop battery"
  else
    profile_list="studio"
  fi

  echo $profile_list
}

# Returns true if this computer contains a profile name, false otherwise.
profile_contains() {
  local element="$1"
  if [[ $(_get_profiles_list | tr ' ' '\n' | grep -c "$element") == 1 ]]; then
    echo true
  else
    echo false
  fi
}

# From a YAML root path, pull all key/values into settings for consumption into sketchybar.
explode_args() {
  local root_path=$1
  
  local bracket_modifier=""
  local final_args=""
  for i in {1..5}; do
    bracket_modifier="${bracket_modifier}.[]"

    # This is a crazy long hack of pipes so let's explain what each line does:
    # 1 + 2: Builds yq query to flatten the key structure by the given depth defined in $bracket_modifier.
    #    explode(.) ensures aliases are passed through.
    # 3 + 4: Paths deeper than the modifier aren't flattened, so remove them from this output.
    # 5: Strip out the root path from the key
    # 6: convert "icon.symbol" to "icon" so our yaml format will translate to sketcybar's options
    # 7: convert "label.content" to "label" so our yaml format will translate to sketcybar's options
    # 8: Convert a yaml "key: value" style into "key=value"
    # 9: Add quotes around values -- pure yaml may not need it but values with spaces will be screwed
    # 10: If it already contained quotes, we now have two sets of quotes.  This strips one of them out.
    local args_segment=$(yq ".${root_path} | $bracket_modifier | {(path | join(\".\")): .} | explode(.)" \
                        < "$HOME/.config/sketchybar/config.yaml" \
                        | grep -v '^ ' \
                        | grep -v ":$" \
                        | sed "s/^${root_path}.//" \
                        | sed "s/^icon.symbol:/icon:/" \
                        | sed "s/^label.content:/label:/" \
                        | sed "s/: /=/" \
                        | sed 's/=/="/;s/$/"/' \
                        | sed 's/""/"/g')

    if [[ "$args_segment" != "" ]]; then
      if [[ "$final_args" == "" ]]; then
        final_args="$args_segment"
      else
        final_args=$(printf "${final_args}\n${args_segment}")
      fi
    fi
  done

  echo "$final_args"
}
