@JobPostsList = React.createClass
  displayName: 'JobPostsList'
  isCurrentPost: (post) ->
    @props.current_post_id == post.id
  postItems: () ->
    for post in @props.posts
      <JobPostListItem
        key={post.id}
        post={post}
        isCurrentPost={post.id == @props.current_post_id}
        changeCurrentPost={@props.changeCurrentPost}
        />
  render: ->
    <div className="job_posts_list">
      {@postItems()}
    </div>
