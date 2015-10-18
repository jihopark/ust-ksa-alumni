# @cjsx React.DOM

@JobPostsIndex = React.createClass
  displayName: 'JobPostsIndex'
  onGoingJobPostList: ->
    <div className='ongoing_job_post_list'>
      <h5>Ongoing Job Posts</h5>
      <JobPostsList posts={@props.ongoing_posts}/>
    </div>
  pastJobPostList: ->
    <div className='past_job_post_list'>
      <h5>Past Job Posts</h5>
      <JobPostsList posts={@props.past_posts}/>
    </div>
  render: ->
    React.DOM.div
      className: 'job_posts_index row'
      React.DOM.div
        className: 'job_posts_list column large-4 small-4'
        if @props.ongoing_posts != null && @props.ongoing_posts.length !=0
          @onGoingJobPostList()
        if @props.past_posts != null && @props.past_posts.length !=0
          @pastJobPostList()
      React.DOM.div
        className: 'job_posts_list column large-8 small-8'
        'JobPostShow'
