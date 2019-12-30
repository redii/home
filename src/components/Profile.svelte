<script>
import ApolloClient from 'apollo-boost'
import gql from 'graphql-tag'

const token = "TOKEN HERE"

const client = new ApolloClient({
  uri: 'https://api.github.com/graphql',
  request: (operation) => {
    operation.setContext({
      headers: {
        authorization: `Bearer ${token}`
      }
    })
  }
})

let user
client.query({
  query: gql`
    query {
      viewer {
        name
        repositories(last: 3) {
          nodes {
            name
            description
            url
          }
        }
      }
    }
  `,
})
  .then(res => {
    user = res.data.viewer
    console.log(user)
  })
  .catch(error => console.error(error))

</script>

<div>
  <img src="https://avatars3.githubusercontent.com/u/14221837" alt="profile picture" />
  <h1>{user ? user.name : ""}</h1>
  <h3>Last 3 updated repositories</h3>
  <ul>
    {#if user}
    {#each user.repositories.nodes as repo}
    <li><a href={repo.url}>{repo.name}</a></li>
    {/each}
    {/if}
  </ul>
</div>

<style>

</style>
