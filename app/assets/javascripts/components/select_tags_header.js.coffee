@SelectTagsHeader = React.createClass
  displayName: 'SelectTagsHeader'
  render: ->
    <dl className="sub-nav">
      <dt>Select:</dt>
      {
        if @props.select == "major"
          <span>
            <dd className="active"><a href="#major">Major</a></dd>
            <dd><a href="#industry" onClick={@props.onClickIndustry}>Industry</a></dd>
          </span>
        else if @props.select == "industry"
          <span>
            <dd><a href="#major" onClick={@props.onClickMajor}>Major</a></dd>
            <dd className="active"><a href="#industry">Industry</a></dd>
          </span>
      }
    </dl>
