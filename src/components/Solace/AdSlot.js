const React = require('react');
const AdSlot = ({ placement = 'home' }) => {
    const config = typeof window !== 'undefined' ? window.SOLACE_ADS : null;
    const item = config?.enabled && Array.isArray(config.items) ? config.items.find((x) => x?.placement === placement) : null;
    if (!item) return null;
    return <aside style={{ margin: '0 0 1.25rem', padding: '1rem 1.2rem', borderRadius: '1rem', border: '1px solid rgba(146,67,255,.28)', background: 'rgba(10,7,28,.78)' }} aria-label={'Sponsored'}><div style={{ fontSize: '.65rem', letterSpacing: '.14rem', opacity: .55, marginBottom: '.35rem' }}>SPONSORED</div><div style={{ display:'flex', alignItems:'center', justifyContent:'space-between', gap:'1rem' }}><div><strong>{item.title || 'Featured'}</strong><div style={{ opacity:.7, marginTop:'.25rem' }}>{item.text || ''}</div></div>{item.url ? <a href={item.url} target={'_blank'} rel={'noreferrer'} style={{ padding:'.55rem .85rem', borderRadius:'.65rem', background:'linear-gradient(90deg,#7b2cff,#12a9ff)', color:'#fff' }}>Open</a> : null}</div></aside>;
};
module.exports = AdSlot;
