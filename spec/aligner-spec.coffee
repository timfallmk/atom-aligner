path = require 'path'

describe "Aligner", ->
  [editor, workspaceElement, editorView, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    atom.project.setPaths([path.join(__dirname, 'fixtures')])

    waitsForPromise ->
      atom.packages.activatePackage('language-coffee-script')

    waitsForPromise ->
      atom.workspace.open('aligner-sample.coffee')

    runs ->
      jasmine.attachToDOM(workspaceElement)
      editor = atom.workspace.getActiveTextEditor()
      editorView = atom.views.getView(editor)

      activationPromise = atom.packages.activatePackage("aligner")

  it "should align two lines correctly", ->
    editor.setCursorBufferPosition([0, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(1)).toBe 'test    = "321"'

  it "should right correctly", ->
    editor.setCursorBufferPosition([6, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(6)).toBe "  foo:        bar"

  it "should not align anything when cursor is not within string", ->
    editor.setCursorBufferPosition([3, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(1)).toBe 'test = "321"'

  it "should handle prefix block correctly", ->
    editor.setCursorBufferPosition([10, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(10)).toBe 'longPrefix  = "test"'

  it "should handle prefix correctly", ->
    editor.setCursorBufferPosition([10, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(11)).toBe 'prefix     += "hello"'

  it "should know how to align operator with no space", ->
    editor.setCursorBufferPosition([13, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(13)).toBe 'noSpace = "work"'

  it "should only align the first ':'", ->
    editor.setCursorBufferPosition([16, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(16)).toBe '  hello:   {not: "world"}'

  it "should align multiple items correctly", ->
    editor.setCursorBufferPosition([20, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(21)).toBe '  ["abc"  , 19293, 102304, "more"]'

  it "should align and keep the same indentation", ->
    editor.setCursorBufferPosition([24, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(24)).toBe '    test    = "123"'

  it "should align and keep the same indentation", ->
    atom.config.set 'editor.softTabs', false
    editor.setCursorBufferPosition([24, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(24)).toBe '    test    = "123"'

  it "should align multiple cursor correctly", ->
    editor.setCursorBufferPosition([0, 1])
    editor.addCursorAtBufferPosition([6, 1])
    editor.addCursorAtBufferPosition([10, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(1)).toBe 'test    = "321"'
      expect(editor.lineTextForBufferRow(6)).toBe "  foo:        bar"
      expect(editor.lineTextForBufferRow(10)).toBe 'longPrefix  = "test"'

describe "Aligning javascript", ->
  [editor, workspaceElement, editorView, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    atom.project.setPaths([path.join(__dirname, 'fixtures')])

    waitsForPromise ->
      atom.packages.activatePackage('language-javascript')

    waitsForPromise ->
      atom.workspace.open('aligner-sample.js')

    runs ->
      jasmine.attachToDOM(workspaceElement)
      editor = atom.workspace.getActiveTextEditor()
      editorView = atom.views.getView(editor)

      activationPromise = atom.packages.activatePackage("aligner")

  it "should align two lines correctly", ->
    editor.setCursorBufferPosition([0, 1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(0)).toBe 'var test   = "hello";'

  it "should align ':' which isn't tokenized with scope", ->
    editor.setCursorBufferPosition([5,1])
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(5)).toBe '  "foo":   "bar"'

  it "should align ',' correctly", ->
    editor.setCursorBufferPosition [9, 1]
    atom.commands.dispatch editorView, 'aligner:align'

    waitsForPromise -> activationPromise

    runs ->
      expect(editor.lineTextForBufferRow(10)).toBe '  ["3"    , 2, 4]'
