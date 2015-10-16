# @cjsx React.DOM

@PreferenceTag = React.createClass
  displayName: 'PreferenceTag'
  getClassName: () ->
    basic = "preference_tag label round "
    if @props.category == "industry"
      return basic + "warning"
    else
      return basic + "success"
  render: ->
    <span className={@getClassName()}>{@props.name}</span>
