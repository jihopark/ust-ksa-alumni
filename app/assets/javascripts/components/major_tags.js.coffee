# @cjsx React.DOM

@MajorTags = React.createClass
  displayName: 'MajorTags'
  render: ->
    majorTags = @props.majors.map (major) ->
      <PreferenceTag key={"major_"+major.id}, name={major.name}, category="major" />

    <div className="major_tags">
      <h6 className="subheader">Majors</h6>
      {
        if @props.majors.length > 0
          {majorTags}
        else
          <h7 className="small">Click here to add major preferences</h7>
      }
    </div>
