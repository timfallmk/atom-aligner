module.exports = {
  "=": {
    alignment:  "left"
    leftSpace:  true
    rightSpace: true
    prefixes:   ["+", "-", "&", "|", "<", ">", "!", "~", "%", "/", "*", "."]
    scope:      "operator|assignment|source"
  }
  ":": {
    alignment:  "right"
    leftSpace:  false
    rightSpace: true
    prefixes:   []
    scope:      "operator|assignment|source"
  }
  ",": {
    leftSpace:  true
    rightSpace: false
    prefixes:   []
    scope:      "delimiter"
    multiple:   {
      "number":
        alignment: "left"
      "string":
        alignment: "right"
    }
  }
}
