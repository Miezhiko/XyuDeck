document.addEventListener("DOMContentLoaded", function () {
  var app = Elm.Popup.init({
    node: document.getElementById('widget')
  });
  document.getElementById("open").addEventListener("click", async function() {
    const div = document.getElementById("mode");
    if (div.textContent == "Twitter") {
      chrome.tabs.create({ 'url': 'https://tweetdeck.twitter.com' });
    } else {
      let myGroups = [ '1139476639086256128'
                     , '1367424121412403206'
                     , '1575466362339840003' ];

      let queryOptions = { currentWindow: true };

      var ids = [];
      var included = [];
      await chrome.tabs.query(queryOptions, async function(tabs) {
        myGroups.forEach(async (groupId) => {
          let link = 'https://twitter.com/i/lists/' + groupId
          await tabs.forEach(async (tab) => {
            if (tab.url == link) {
              ids.push(tab.id);
              if (!included.includes(link)) {
                included.push(link);
              }
            }
          });
        });
      });

      myGroups.forEach(async (groupId) => {
        let link = 'https://twitter.com/i/lists/' + groupId
        if (!included.includes(link)) {
          await chrome.tabs.create({ url: link });
        }
      });

      // TODO:
      //var group = await chrome.tabs.group({ tabIds: ids });
      //chrome.tabGroups
      //      .update(group, { collapsed: false, title: "Xyutter", color: "red" });
    }
  });
  document.getElementById("options").addEventListener("click", function() {
    chrome.runtime.openOptionsPage();
  });
});
