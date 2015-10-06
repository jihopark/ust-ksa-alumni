# @cjsx React.DOM

@PreferenceTag = React.createClass
  displayName: 'PreferenceTag'
  render: ->
    <span className="preference_tag">{@props.name}</span>
