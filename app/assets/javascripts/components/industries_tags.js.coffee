# @cjsx React.DOM

@IndustryTags = React.createClass
  displayName: 'IndustryTags'
  render: ->
    industryTags = @props.industries.map (industry) ->
      <PreferenceTag key={"industry_"+industry.id}, name={industry.name}, category="industry" />

    <div className="industries_tags">
      <h6 className="subheader">Industries</h6>
      {
        if @props.industries.length > 0
          {industryTags}
        else
          <h7 className="small">Click here to add industry preferences</h7>
      }
    </div>
