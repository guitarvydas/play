const src = String.raw`
a b 
⟪
{
  f : function () {
    var h = 'hello';
      ⟪
	var w = 'world';
      ⟫
	⟪return (h + ' ' + w);⟫
  }
}
⟫
c d
`;
