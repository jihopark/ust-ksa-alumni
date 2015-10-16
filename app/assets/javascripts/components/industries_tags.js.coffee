# @cjsx React.DOM

@IndustryTags = React.createClass
  displayName: 'IndustryTags'
  render: ->
    industryTags = @props.industries.map (industry) ->
      <PreferenceTag key={"industry_"+industry.id}, name={industry.name}, category="industry" />

    <div className="industries_tags">
      <h5>Selected Industries</h5>
      {
        if @props.industries.length > 0
          {industryTags}
        else
          <h7 className="small">Add industries on the right</h7>
      }
    </div>
