# @cjsx React.DOM

@SelectTag = React.createClass
  displayName: 'SelectTag'
  render: ->
    <li className="select_tag">
      <input type="checkbox"/>
      {@props.item.name}
    </li>
