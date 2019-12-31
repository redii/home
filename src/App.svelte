<script>
import ApolloClient from 'apollo-boost'
import gql from 'graphql-tag'

import Loading from './components/Loading.svelte'
import Header from './components/Header.svelte'
import Home from './components/Home/Home.svelte'

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
        email
        bio
        location
        url
        avatarUrl
        websiteUrl
        pinnedItems(last:4) {
          nodes {
            ... on Repository {
              id
              name
              description
              url
              homepageUrl
              mirrorUrl
              openGraphImageUrl
              createdAt
              updatedAt
              licenseInfo {
                key
                name
                url
              }
            }
          }
        }
      }
    }

  `,
})
  .then(res => {
    user = res.data.viewer
  })
  .catch(error => console.error(error))
</script>

<div id="app">
  {#if user}
  <Header user={user}/>
  <Home user={user}/>
  {:else}
  <Loading />
  {/if}
</div>
