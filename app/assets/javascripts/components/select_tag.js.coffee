# @cjsx React.DOM

@SelectTag = React.createClass
  displayName: 'SelectTag'
  getInitialState: ->
    checked: @props.checked
  handleChange: (event) ->
    @setState
      checked: event.target.checked
    @props.onCheckBoxChange(@props.item, event.target.checked, @props.select)
  render: ->
    checked = @state.checked
    <li className="select_tag">
      <input type="checkbox" checked={checked} onChange={@handleChange}/>
      {@props.item.name}
    </li>
