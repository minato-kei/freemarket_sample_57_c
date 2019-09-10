class Price < ActiveHash::Base
  self.data = [
      {id: 1, name: '300~1000'}, {id: 2, name: '1000~5000'}, {id: 3, name: '5000~10000'},
      {id: 4, name: '10000~30000'}, {id: 5, name: '30000~50000'}]
end